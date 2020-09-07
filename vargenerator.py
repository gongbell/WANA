class Generator:
    def __init__(self):
        self.count = 0 #

    def gen_owner_store_var(self, position, var_name=""):
        return "Ia_store-%s-%s" % (str(position), var_name)