from pydantic import BaseModel, Field

class BotMessage(BaseModel):
    message: str = Field(
        ...,
        title="Message",
        description="The message to send",
        example="Hello, World!"
    )
