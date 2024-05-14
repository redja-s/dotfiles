# Scripts to fix suspend issues

## Suspend wakes up immediately after `systemctl suspend`

### `fix-wakeup.sh`
1. Symlink this file to a folder in $PATH (use `echo $PATH`)
2. Ensure it is executable (check with `ls -l`)
3. Open crontab (`sudo crontab -e`) and add `@reboot <path_to_script>/fix-wakeup.sh`

### References:

- https://www.reddit.com/r/linux4noobs/comments/167z5o4/issue_with_sleep_on_ubuntukde_system_resumes/jysnov2/
- https://askubuntu.com/questions/152403/how-do-i-make-changes-to-proc-acpi-wakeup-permanent

## Notes
- `S3` = Suspend; `S4` = Hibernate
