players = []

def __resume_players(players):
    """
    Resume all playing media players using dbus.
    """
    for player in players:
        player.Play()

def on_start_break(break_obj):
    """
    Lifecycle method executes just before the break.
    """
    global players
    players = __active_players()
    if players:
        __pause_players(players)

def on_stop_break():
    """
    After the break, resume media
    """
    global players
    if players:
        import time
        time.sleep(0.5)
        __resume_players(players)
        players = []
