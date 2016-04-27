import youtube_dl

class SimpleYDL(youtube_dl.YoutubeDL):
    
    def __init__(self, *args, **kargs):
        super(SimpleYDL, self).__init__(*args, **kargs)
        self.add_default_info_extractors()

def get_stream(ytid):
    ydl_opts = {
        'nocheckcertificate': True,
        'skip_download': True,
        'cachedir': False,
        'format': 18,
        'prefer_insecure': True,
    }
    res = SimpleYDL(ydl_opts).extract_info(ytid, process=False, download=False)
    data = {item['format_id']: item['url'] for item in res['formats']}
    data['title'] = res['title']
    data['info'] = res['description']
    obj = {'duration':res['duration'] }
    obj['stream'] = data['18']
    return obj

def add_func(a,b):
    return a+b