#!/bin/bash
if [ "$PAM_TYPE" != "open_session" ]
then
  exit 0
fi
echo "Login '$PAM_USER' from '$PAM_RHOST'" | mail -s "SSH Login ALERT!!!!" erkipolo@gmail.com
exit 0
