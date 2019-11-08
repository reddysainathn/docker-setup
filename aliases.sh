cat >> my_aliases.sh <<EOL
# Default Linux Aliases
alias dir='ls -ltr'
alias ll='ls -larth'

# Docker aliases (shortcuts)
# List all containers by status using custom format
alias dkpsa='docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}"'
# Removes a container, it requires the container name \ ID as parameter
alias dkrm='docker rm -f'
# Removes an image, it requires the image name \ ID as parameter
alias dkrmi='docker rmi'
# Lists all images by repository sorted by tag name
alias dkimg='docker image ls --format "table {{.Repository}}\t{{.Tag}}\t{{.ID}}" | sort'
# Lists all persistent volumes
alias dkvlm='docker volume ls'
# Diplays a container log, it requires the image name \ ID as parameter
alias dklgs='docker logs'
# Streams a container log, it requires the image name \ ID as parameter
alias dklgsf='docker logs -f'
# Initiates a session withing a container, it requires the image name \ ID as parameter followed by the word "bash"
alias dkterm='docker exec -it'
# Starts a container, it requires the image name \ ID as parameter
alias dkstrt='docker start'
# Stops a container, it requires the image name \ ID as parameter
alias dkstp='docker stop'
EOL

echo "Alias Loading Started!"

# if [ -f ~/my_aliases.sh ]; then
# source ~/my_aliases.sh
# fi
if [ -f ~/.bashrc ]; then
cat <<EOT >> .bashrc
if [ -f ~/my_aliases.sh ]; then
source ~/my_aliases.sh
fi
EOT
else
  cd
  touch .bashrc
  cat <<EOT >> .bashrc
  if [ -f ~/my_aliases.sh ]; then
  source ~/my_aliases.sh
  fi
EOT
fi
bash
echo "Alias Loading Complete!"
