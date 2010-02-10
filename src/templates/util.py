def url(link):
    if link == 'None':
        return None

    heads = (
        ('http:/', 'http://'),
        ('https:/', 'https://'),
    )
    for find, replace in heads:
        if link[:len(find)] == find:
            link = link.replace(find, replace, 1)
            break

    for tail in ('index.html', 'index.htm', 'index.php'):
        if link.endswith(tail):
            link = link.rpartition(tail)[0]
            break

    if link == '':
        link = './'

    return link
