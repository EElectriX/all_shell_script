#Write a script to generate a secure, random password with at least one uppercase letter,
#one lowercase letter, one number, and one special character. The length of the password
#should be a script argument (minimum length of 8 characters).

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <password_length>"
  exit 1
fi

length=$1

if [ "$length" -lt 8 ]; then
  echo "Password length should be at least 8 characters."
  exit 1
fi

upper=$(tr -dc 'A-Z' < /dev/urandom | head -c 1)
lower=$(tr -dc 'a-z' < /dev/urandom | head -c 1)
number=$(tr -dc '0-9' < /dev/urandom | head -c 1)
special=$(tr -dc '!@#$%^&*()_+-=' < /dev/urandom | head -c 1)
remaining=$(tr -dc 'A-Za-z0-9!@#$%^&*()_+-=' < /dev/urandom | head -c $(($length - 4)))
password=$(echo "$upper$lower$number$special$remaining" | fold -w1 | shuf | tr -d '\n')

echo "Generated password: $password"


