# http://brokenbrake.biz/2010/08/03/.zshrc
PATH=/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin
autoload -U compinit			# загрузка умных автодополнений
compinit -D 				# вкл. автодополнение c кэшем для ускорения (-D)
autoload colors && colors 		# раскраска через $fg, $bg etc.
#autoload zcalc 				# калькулятор :) 
zstyle ':completion:*' menu yes select	# меню с выбором стрелочками

# Загрузка модуля приглашения
autoload promptinit
promptinit
# Тема приглашения
prompt adam2 green yellow yellow white

# Как выглядит приглашение (http://welinux.ru/post/3811/#cmnt72362)
#PROMPT="%~ %(#.%{$bg[red]%}.%{$fg[green]%})%n%{$reset_color%}@%m%(?.%{$fg[green]%}.%{$bg[red]%}) %(!.#.$) >%{$reset_color%} "

# Исправлять ошибки
setopt correctall
# Что при этом говорит?
SPROMPT="	$fg[red]%R →$reset_color $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "

# Переходить в каталоги без набора cd
setopt autocd


# Сочетания клавиш в стиле Vim (обычно по умолчанию e - emacs)
# При этом можно нажать Esc и редактировать строку привычным образом!
# Вообще-то это охренительно :) Супер.
bindkey -e
setopt ZLE	# собственно, сам редактор (вкл. умолчально, просто подстраховался)

# На всякий случай, чтобы не было проблем с UTF-8
setopt MULTIBYTE

# Включение поддержки выражений вроде «{1-3}» или «{a-d}» — они будут разворачиваться
#  в «1 2 3» и «a b c d» соответственно
setopt BRACECCL

# Фортунки
#fortune lorquotes

# Файлы с цифрами сортировать числовым методом, а не лексическим
setopt NUMERIC_GLOB_SORT

# Смена заголовка окна. По дефолту zsh. Или название выполняемой в данный момент команды
case $TERM in
xterm* | rxvt*)
# precmd вызывается непосредственно перед выводом prompt
precmd() {
print -Pn "\e]0;zsh\a"
}
# preexec вызывается перед выполнением команды
# $1 — имя команды (точнее, вся команда со всеми переданными параметрами)
# sed используется для «отрезания» от команды параметров
preexec() {
print -Pn "\e]0;`echo $1 | sed -r 's/^([^[:space:]]+).*/\1/'`\a"
}
;;
esac


# Куда писать историю
HISTFILE=~/.zsh-history
# Число команд, сохраняемых в истории
SAVEHIST=1000
# Не вносить дубликаты команд в историю (последняя перепишет старую)
setopt HIST_IGNORE_ALL_DUPS
# Не писать в историю команды, начинающиеся с пробела
setopt HIST_IGNORE_SPACE
# Постепенное дополнение истории во время работы (если я правильно понял)
setopt INC_APPEND_HISTORY
# последние комманды в начале файла и не хранить дубликаты
setopt histexpiredupsfirst histfindnodups

# Настройка цветового диапазона для терминала
export TERM=xterm-256color	# 21-й век же! Почти true color :-D

# Умолчальный редактор
export EDITOR=vim

#----------------------------------------
# Всякие разные удобные ФУНКЦИИ
#----------------------------------------

# SlackWare: проверить версию или наличие пакета. Это мой первый конвейер без grep! :)
#pkg() { ls /var/log/packages/$1* | awk -F/ '{ print $5}' }
 
# Создать каталог и перейти в него (http://muhas.ru/?p=55)
mkd() { mkdir $1; cd $1 }

# Распаковка любого архива (http://muhas.ru/?p=55)
unpack() {
if [ -f $1 ] ; then
case $1 in
	*.tar.bz2)   tar xjf $1        ;;
	*.tar.gz)    tar xzf $1     ;;
	*.bz2)       bunzip2 $1       ;;
	*.rar)       unrar x $1     ;;
	*.gz)        gunzip $1     ;;
	*.tar)       tar xf $1        ;;
	*.tbz2)      tar xjf $1      ;;
	*.tgz)       tar xzf $1       ;;
	*.zip)       unzip $1     ;;
	*.Z)         uncompress $1  ;;
	*.7z)        7z x $1    ;;
	*)           echo "Cannot unpack '$1'..." ;;
esac
else
echo "'$1' is not a valid file"
fi
}

# ... и упаковка (http://muhas.ru/?p=55)
pack() {
if [ $1 ] ; then
case $1 in
	tbz)   	tar cjvf $2.tar.bz2 $2      ;;
	tgz)   	tar czvf $2.tar.gz  $2   	;;
	tar)  	tar cpvf $2.tar  $2       ;;
	bz2)	bzip $2 ;;
	gz)		gzip -c -9 -n $2 > $2.gz ;;
	zip)   	zip -r $2.zip $2   ;;
	7z)    	7z a $2.7z $2    ;;
	*)     	echo "'$1' Cannot be packed via pack()" ;;
esac
else
echo "'$1' is not a valid file"
fi
}


# Сокращения
alias mv='nocorrect mv'       			# чтобы случайно не удалить чего-нибудь
alias cp='nocorrect cp'       			# ... или не скопировать
alias mkdir='nocorrect mkdir' 			# ... или не сделать лишний каталог
alias ls='ls --color=auto'			# с цветом быстрее видно где каталоги, где файлы
alias lsd='ls -ld .*'				# увидеть dot-файлы
alias grep='grep --color=auto'			# расцветка фильтра
alias -g KU="| iconv -c -f koi8r -t utf8" 	# http://muhas.ru/?p=55
alias -g CU="| iconv -c -f cp1251 -t utf8" 	# http://muhas.ru/?p=55


# Привязки файлов к программам
alias -s {avi,mpeg,mpg,mov,m2v,flv,mkv,mp4}=mplayer2
alias -s txt=vim
alias -s {ogg,mp3,wav}=mpg321


# Алиасы
alias l='ls -CF'
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias update-manager='gksu update-manager'
alias synaptic='gksu synaptic'
alias wine='LANG=ru_RU.utf8 wine'
alias mc='LANG=en_US.utf8 mc'
alias svim='sudo vim'
#alias emerge='emerge -v'
alias less='most'
# alias vim='gvim'
# alias mplayer2='mplayer2  -heartbeat-cmd "xscreensaver-command -deactivate"'
alias mplayer2='mplayer2 -stop-xscreensaver -subcp enca:ru:utf8'

# Цветной man
export LESS_TERMCAP_mb=$'\E[01;31m' 
export LESS_TERMCAP_md=$'\E[36;01m' 
export LESS_TERMCAP_me=$'\E[0m' 
export LESS_TERMCAP_se=$'\E[0m' 
export LESS_TERMCAP_so=$'\E[47;30m' 
export LESS_TERMCAP_ue=$'\E[0m' 
export LESS_TERMCAP_us=$'\E[01;32m' 

bindkey "\e[3~" delete-char			#Delete key

bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
