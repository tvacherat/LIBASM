/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tvachera <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/05 15:48:42 by tvachera          #+#    #+#             */
/*   Updated: 2021/02/15 19:48:34 by tvachera         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>

typedef struct 		s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

int				ft_strlen(char *);
char			*ft_strcpy(char *, char *);
int				ft_strcmp(char *, char *);
int				ft_write(int, void *, size_t);
int				ft_read(int, void *, size_t);
char			*ft_strdup(char *);
int				ft_atoi_base(char *, char *);
int				ft_list_size(t_list *begin_list);
void			ft_list_sort(t_list **begin_list, int (*cmp)());
void			ft_list_push_front(t_list **begin_list, void *data);
void			ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

#endif
