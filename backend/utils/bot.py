import cv2
import numpy as np
from sklearn.cluster import KMeans

def process_image(temp_file):
    temp_file.seek(0)
    binary_data = temp_file.read()
    image_array = np.frombuffer(binary_data, dtype=np.uint8)
    image = cv2.imdecode(image_array, cv2.IMREAD_COLOR)
    return image

def extract_colors(image, num_colors=4):
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    image = image.reshape((image.shape[0] * image.shape[1], 3))

    kmeans = KMeans(n_clusters=num_colors)
    kmeans.fit(image)

    colors = kmeans.cluster_centers_.astype(int)
    return colors.flatten()

def predict_season(image, model):
    colors = extract_colors(image, num_colors=4)
    colors = colors.reshape(1, -1)
    prediction = model.predict(colors)
    return prediction[0]

def get_hex_colors(season):
    colors = {
        'invierno': ['#000000', '#FFFFFF', '#FF00FF', '#8B0000', '#00FFFF', '#C0C0C0'],  # Negro, blanco, fucsia, rojo oscuro, cian, plata
        'verano': ['#FFD700', '#FF69B4', '#87CEEB', '#D3D3D3', '#00BFFF', '#F0E68C'],    # Amarillo pálido, fucsia, azul cielo, gris claro, azul profundo, caqui
        'primavera': ['#FF4500', '#FFDAB9', '#FFFF00', '#7FFFD4', '#FF6347', '#98FB98'],  # Rojo anaranjado, melocotón, amarillo, aqua, tomate, verde claro
        'otono': ['#8B4513', '#CD5C5C', '#FFA500', '#FFE4B5', '#A0522D', '#8FBC8F']        # Marrón, rojo, naranja, beige, marrón claro, verde mar
    }
    return colors.get(season.lower(), [])

def get_recognition(model, image):

    image = process_image(image)

    if image is not None:
        predicted_season = predict_season(image, model)
        hex_colors = get_hex_colors(predicted_season)

        return hex_colors
    else:
        return []
