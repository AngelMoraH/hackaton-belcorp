import fastapi
import logging
from decouple import config
from openai import OpenAI
import time
import json
import copy

from schemas.bot import BotMessage

OPENAI_API_KEY = config('OPENAI_API_KEY')
ASSISTANT_ID = config('ASSISTANT_ID')

client = OpenAI(
    api_key=OPENAI_API_KEY
)

router = fastapi.APIRouter(prefix='/bot')

conversation = []

@router.get('/')
async def index():
    return {"message": "BOT API"}

@router.post('/msg')
async def create_message(
    message: BotMessage
):
    new_message = {
        "role": "user",
        "content": message.message
    }

    conversation.append(new_message)

    messages = copy.deepcopy(conversation)

    messages[-1]["content"] = conversation[-1]["content"] + ". Recuerda responderme con el formato establecido, no me respondas de otra manera."

    thread = client.beta.threads.create(
        messages=messages
    )

    run = client.beta.threads.runs.create(
        thread_id=thread.id,
        assistant_id=ASSISTANT_ID
    )

    while run.status != "completed":
        run = client.beta.threads.runs.retrieve(
            thread_id=thread.id,
            run_id=run.id
        )
        logging.debug(run.status)
        time.sleep(1)

    message_reponse = client.beta.threads.messages.list(
        thread_id=thread.id
    )

    messages = message_reponse.data

    latest_message = messages[0].content[0].text.value

    logging.debug(latest_message)

    clean_message = latest_message.replace(
        '```json', '').replace(
        '```', '').replace(
        '\\n', '').strip()

    parsed_message = json.loads(clean_message)

    logging.debug(parsed_message)

    response_message = {
        "role": "assistant",
        "content": parsed_message["message"]
    }

    conversation.append(response_message)
    return parsed_message
    # return {}
