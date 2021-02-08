NAME		=	libasm.a
CC			=	nasm
CFLAGS		=	-f elf64
AR 			= 	ar
ARFLAGS 	=	rcs
RM			=	rm -rf
SRC_DIR		=	srcs
SRC 		=	$(notdir $(shell find $(SRC_DIR) -type f -name *.s))
OBJ_DIR		=	objs
OBJ			=	$(addprefix $(OBJ_DIR)/, $(SRC:.s=.o))
TEST		=	test
vpath 			%.s $(shell find $(SRC_DIR) -type d)
.SUFFIXES: 		.s .o

_YELLOW		=	\033[38;5;184m
_GREEN		=	\033[38;5;46m
_RESET		=	\033[0m
_INFO		=	[$(_YELLOW)INFO$(_RESET)]
_SUCCESS	=	[$(_GREEN)SUCCESS$(_RESET)]
_CLEAR		=	\033[2K\c

all				:	init $(NAME)
					@ echo "$(_SUCCESS) ${NAME} created"

init			:
					@ echo "$(_INFO) Initializing libft..."
					@ $(shell mkdir -p $(OBJ_DIR))

$(NAME)			:	$(OBJ)
					@ echo "\t$(_YELLOW)Creating Library...$(_RESET)\r\c"
					@ $(AR) $(ARFLAGS) $(NAME) $(OBJ)
					@ echo "$(_CLEAR)"

$(OBJ_DIR)/%.o	:	%.s
					@ echo "\t$(_YELLOW)Compiling$(_RESET) $*.s\r\c"
					@ $(CC) $(CFLAGS) $< -o $@
					@ echo "$(_CLEAR)"

clean			:
					@ echo "$(_INFO) Cleaning LIBASM's binary files"
					@ $(RM) $(OBJ_DIR)
				
fclean			:	clean
					@ $(RM) $(NAME)
					@ $(RM) $(TEST)

re				: 	fclean all

.PHONY: 		all fclean clean re
