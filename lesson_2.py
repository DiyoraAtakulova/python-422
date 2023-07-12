import requests
from bs4 import BeautifulSoup
import pprint

def parse_ycombinator():
    results = []
    for page in range(1, 4):
        url = f"https://news.ycombinator.com/?p={page}"
        res = requests.get(url)
        soup = BeautifulSoup(res.text, "html.parser") #parser the code and returns bs4 obj

        titles = soup.find_all(class_="titleline")
        score_parents = soup.select(".subtext")

        for id, title in enumerate(titles):
            if score := score_parents[id].find(class_="score"):
                score = score.string.split()[0]
                results.append(
                    {
                        "title": title.a.string,
                        "link": title.a["href"],
                        "score": score,
                    }
                )
            else:
                results.append(
                    {
                        "title": title.a.string,
                        "link": title.a["href"],
                        "score": 0,
                    }
                )

    return results

res = parse_ycombinator()
pprint.pp(res)
print(len(res))
