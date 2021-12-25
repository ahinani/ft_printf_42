# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ahinani <ahinani@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/07 12:58:29 by ahinani           #+#    #+#              #
#    Updated: 2021/12/10 14:45:10 by ahinani          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

CC = gcc

CFLAGS = -Wall -Wextra -Werror

SRC =	ft_print_hexa.c		\
		ft_print_ptr.c		\
		ft_printf.c			\
		ft_print_percent.c	\
		ft_print_str.c		\
		ft_print_id.c		\
		ft_print_unsigned.c

OBJECTS = $(SRC:.c=.o)

INCLUDES = include/ft_printf.h

all: $(NAME)

$(NAME): $(OBJECTS) $(INCLUDES)
	@make -C libft_c
	@cp libft_c/libft.a .
	@mv libft.a libftprintf.a
	ar rcs $(NAME) $(OBJECTS)

%.o : %.c
	$(CC) $(CFLAGS) -I include -o $@ -c $<

clean:
	make fclean -C libft_c
	rm -rf $(OBJECTS)

fclean: clean
	rm -rf /libft_c/libft.a
	rm -rf $(NAME)

re: fclean all