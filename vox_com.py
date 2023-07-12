import requests
from bs4 import BeautifulSoup
import pprint


    
# url = "https://www.vox.com/technology/archives/1"
# r = requests.get(url)
# soup = BeautifulSoup(r.text, "html.parser")
# title = soup.find_all(class_="c-entry-box--compact__title")
# print(title)



def vox():
    results = []
    for page in range(1, 16):
        url = f"https://www.vox.com/technology/archives/{page}"
        r = requests.get(url)
        soup = BeautifulSoup(r.text, "html.parser")

    
        titles = soup.find(class_="c-entry-box--compact__title")
        # titles = soup.select(".c-entry-box--compact__title")
        authors = soup.find("span", class_="c-byline__item").find(class_="c-byline__author-name")
        date_time = soup.find("time", class_="c-byline__item")

        # for id, title in enumerate(titles):
        #     date = date_time[id].string.strip()
        results.append(
            {
                "title": titles.string,
                "link": titles.a["href"],
                "author": "By" + authors.string,
                "date": date_time.string.strip(),
            }
        )
        # print(len(results))
    return results
    

v = vox()
pprint.pp(v)


# title = soup.find(class_="c-entry-box--compact__title")
# pprint.pp(title.text)


# link = title.a["href"]
# print(link)
# # author_link = soup.find("span", class_="c-byline__item").a["href"]
# # print(author_link)
# author = soup.find("span", class_="c-byline__item").find(class_="c-byline__author-name")
# print(author.text)
# date = soup.find("time", class_="c-byline__item").string.strip()
# print(date)

