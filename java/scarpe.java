import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import java.io.IOException;

public class WebScrape {
    public static void main(String[] args) {
        String url = "https://www.example.com/";
        try {
            Document document = Jsoup.connect(url).get();
            Elements pTags = document.select("p");
            String pTagText = pTags.text();
            System.out.println("Text inside <p> tags: " + pTagText);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
