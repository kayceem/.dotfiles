    def __fire_pre_break(self):
        """
        Show the notification and start the break after the notification.
        """
        self.context['state'] = State.PRE_BREAK
        if utility.check_idle() or (not is_long_break and (utility.check_fullscreen() or utility.check_gaming())):
            logging.info("Skip the break because of full screen application")
            self.__start_next_break()
            return
        if not self.on_pre_break.fire(self.break_queue.get_break()):
            # Plugins wanted to ignore this break
            self.__start_next_break()
            return
        utility.start_thread(self.__wait_until_prepare)
