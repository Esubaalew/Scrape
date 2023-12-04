using System;
using System.Net;

class Program
{
    static void Main()
    {
        string url = "https://www.example.com/";
        using (WebClient client = new WebClient())
        {
            string html = client.DownloadString(url);
            string pTagText = ExtractTextBetweenTags(html, "p");
            Console.WriteLine("Text inside <p> tags: " + pTagText);
        }
    }

    static string ExtractTextBetweenTags(string html, string tag)
    {
        string startTag = $"<{tag}>";
        string endTag = $"</{tag}>";
        int startIndex = html.IndexOf(startTag) + startTag.Length;
        int endIndex = html.IndexOf(endTag, startIndex);
        return html.Substring(startIndex, endIndex - startIndex);
    }
}
