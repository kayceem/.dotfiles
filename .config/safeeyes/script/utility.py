def check_fullscreen():
    try:
        result = subprocess.check_output(["hyprctl", "activewindow", "-j"], text=True)
        result = json.loads(result)
        if result['fullscreen'] == 2:
            return True
    except Exception as e:
        logging.error(e)
    return False    

def check_idle():
    IDLE_FILE = '/tmp/idle_status'
    if not os.path.isfile(IDLE_FILE):
        return False
    with open(IDLE_FILE, 'r') as f:
        idle = f.read().splitlines()[0]
    if idle == '1':
        return True
    return False

