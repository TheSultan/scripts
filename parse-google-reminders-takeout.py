import json
import os

from bs4 import BeautifulSoup

def parse_list(lst):
    fields = dict()
    for item2 in lst.children:
        field, other = item2.label.decode_contents().split(':')
        if item2.span:
            if item2.span.ul:
                val = parse_list(item2.span.ul)
            else:
                val = item2.span.decode_contents()
        else:
            val = ""
        if other and val:
            raise Exception(f"Unexpected state: both other and val exist: {field}, {other}, {val}")
        if not val:
            val = other
        if isinstance(val, str):
            val = val.strip()
        fields[field] = val
    return fields

html_file = f"{os.environ['HOME']}/Downloads/takeout/Reminders/Reminders.html"
with open(html_file, 'r') as f:
    contents = f.read()
    soup = BeautifulSoup(contents, 'lxml')

    not_archived_reminders = []
    for item in soup.html.body.ul.children:
        fields = parse_list(item.ul)
        if fields["State"] != "archived":
            not_archived_reminders.append(fields)
    
    final_dict = dict(reminders=not_archived_reminders)
    print(json.dumps(final_dict, indent=4))
