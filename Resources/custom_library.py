import random
import string


class custom_library:

    def random_emails(self):
        email = self._random_string(10) + "@" + self._random_string(6) + ".com"
        return email

    def _random_string(self, string_length=8):
        r_string = string.ascii_lowercase
        return ''.join(random.choice(r_string) for i in range(string_length))
