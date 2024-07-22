package com.winkelsoft.pos.shared.application.service.support

import com.google.auth.oauth2.GoogleCredentials
import com.google.cloud.storage.BlobId
import com.google.cloud.storage.BlobInfo
import com.google.cloud.storage.StorageOptions
import java.net.URLEncoder
import java.nio.charset.StandardCharsets
import java.util.Base64
import java.util.UUID
import org.springframework.stereotype.Service

@Service
class FileService {
    companion object {
        const val CATEGORY_PATH = "images/categories/"
        const val PRODUCT_PATH = "images/products/"

        private const val FIREBASE_JSON_FILE_NAME = "winkelsoft-35c62-firebase-adminsdk-aj7wl-4adf880261.json"
        private const val BUCKET_NAME = "winkelsoft-35c62.appspot.com"
        private const val CONTENT_TYPE = "image/png"
        private const val DOWNLOAD_URL =
            "https://firebasestorage.googleapis.com/v0/b/$BUCKET_NAME/o/%s?alt=media&token=%s"
    }

    fun upload(id: String, imageBase64: String, folder: String): String {
        try {
            val image = Base64.getDecoder().decode(imageBase64)
            val name = "$folder$id"
            StorageOptions.newBuilder().setCredentials(
                GoogleCredentials.fromStream(
                    FileService::class.java.getClassLoader().getResourceAsStream(FIREBASE_JSON_FILE_NAME)
                )
            ).build().service.create(
                BlobInfo.newBuilder(BlobId.of(BUCKET_NAME, name)).setContentType(CONTENT_TYPE).build(), image
            )
            return String.format(
                DOWNLOAD_URL, URLEncoder.encode(name, StandardCharsets.UTF_8), UUID.randomUUID().toString()
            )
        } catch (ex: Exception) {
            return imageBase64
        }
    }

    fun delete(id: String) {
        val name = "$CATEGORY_PATH$id"
        StorageOptions.newBuilder().setCredentials(
            GoogleCredentials.fromStream(
                FileService::class.java.getClassLoader().getResourceAsStream(FIREBASE_JSON_FILE_NAME)
            )
        ).build().service.delete(BlobId.of(BUCKET_NAME, name))
    }
}