##
## EPITECH PROJECT, 2019
## Makefile asm
## File description:
## Makefile
##

SRC	=	./src/strlen.asm	\
		./src/strchr.asm	\
		./src/memset.asm	\
		./src/memcpy.asm	\
		./src/memmove.asm	\
		./src/strcmp.asm	\
		./src/strncmp.asm	\
		./src/strcasecmp.asm	\
		./src/rindex.asm	\
		./src/strstr.asm	\
		./src/strpbrk.asm	\
		./src/strcspn.asm


OBJ	=	$(SRC:.asm=.o)

NAME	=	libasm.so

ASFLAGS	=	-f elf64

CC	=	ld

all:	$(NAME)

$(NAME):$(OBJ)
	$(CC) -fPIC -shared $(OBJ) -o $(NAME)

clean:
	rm -f *.asm~

%.o: %.asm
	nasm $(ASFLAGS) -o $@ $<

fclean:	clean
	rm -f $(OBJ)
	rm -f $(NAME)
	rm -f *.gcno *.gcda *.o

re:	fclean all

.PHONY:	fclean clean all re
