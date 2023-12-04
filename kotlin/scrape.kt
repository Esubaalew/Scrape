import org.jsoup.Jsoup

fun main() {
    val url = "https://www.example.com/"
    try {
        val document = Jsoup.connect(url).get()
        val pTags = document.select("p")
        val pTagText = pTags.text()
        println("Text inside <p> tags: $pTagText")
    } catch (e: Exception) {
        e.printStackTrace()
    }
}
