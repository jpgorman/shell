#!/bin/sh
file_name="address_book"
create_address_book()
{
  [ -f "$file_name" ] && \
    echo "${file_name} exists" || \
    touch "${file_name}"
}

echo "Please enter contact details"
create_address_book
read name email
if [ -n "$name" ] && [ -n "$email" ]; then
  echo "${name}:${email}" | tee -a $file_name > /dev/null
  echo "You entered ${name} and ${email}"
else
  echo "Please enter a name followed by an email"
fi


search_address_book() {
  term=$1
  echo "Searching for ${term}"
  total=`grep -c "${term}" $file_name`
  if [ "$total" -gt 0 ]; then
    matches=`grep "${term}" $file_name | cut -d: -f1-2`
    echo "Found ${total} matches for ${term}"
    echo "${matches}" | tr ":" " "
  else
    echo "No matches found for ${term}"
  fi
}

edit_address()
{
  term=$1
  total=`grep -c "${term}" $file_name`
  if [ "$total" -gt 0 ]; then
    matches=(`grep "${term}" $file_name | cut -d: -f1-2`)
    select answer in "${matches[@]}"; do
      echo "You have chosen ${answer}" | tr ":" " "
      echo "Replace with?"
      read replacement
      sed -i s/${answer}/${replacement}/g $file_name
      echo $replacement
      break
      [[ $item == exit ]] && break
    done
  else
    echo "No matches found for ${term}"
  fi
}
