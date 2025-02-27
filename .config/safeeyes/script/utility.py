def check_fullscreen():
    try:
        result = subprocess.check_output(["hyprctl", "activewindow", "-j"], text=True)
        result = json.loads(result)
        if result['fullscreen'] == 2:
            return True
    except Exception as e:
        logging.error(e)
    return False    
