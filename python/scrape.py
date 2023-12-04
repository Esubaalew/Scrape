import requests
from bs4 import BeautifulSoup

url = 'https://www.example.com/'
response = requests.get(url)
html = response.text

soup = BeautifulSoup(html, 'html.parser')
p_tags = soup.find_all('p')

p_tag_text = ' '.join(tag.get_text() for tag in p_tags)
print("Text inside <p> tags:", p_tag_text)
