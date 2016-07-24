create table chapters ( 
    id                             int not null auto_increment, 
    title                          varchar(255) not null, 
    sort_order                     int not null default 0, 
    primary key (id) 
) type=innodb; 
create table recipes ( 
    id                             int not null auto_increment, 
    chapter_id                     int not null, 
    title                          varchar(255) not null, 
    problem                        text not null, 
    solution                       text not null, 
    discussion                     text not null, 
    see_also                       text null, 
    sort_order                     int not null default 0, 
        primary key (id, chapter_id, title),  
        foreign key (chapter_id) references chapters(id) 
) type=innodb; 
create table tags ( 
    id                             int not null auto_increment, 
    name                           varchar(80) not null, 
        primary key (id) 
) type=innodb; 
create table recipes_tags ( 
    recipe_id                      int not null, 
    tag_id                         int not null, 
        primary key (recipe_id, tag_id), 
        foreign key (recipe_id) references recipes(id), 
        foreign key (tag_id)  references tags(id) 
) type=innodb;
