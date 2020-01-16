CREATE TABLE public.addresses (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    text text NOT NULL,
    lat numeric,
    long numeric,
    pin text,
    user_id uuid NOT NULL
);
CREATE TABLE public.cart_items (
    cart_id uuid NOT NULL,
    item_id uuid NOT NULL,
    quantity integer NOT NULL
);
CREATE TABLE public.carts (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL
);
CREATE TABLE public.items (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name text NOT NULL,
    stock integer NOT NULL
);
CREATE TABLE public.orders (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    address_id uuid NOT NULL,
    cart_id uuid NOT NULL
);
CREATE TABLE public.users (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name text NOT NULL
);
ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (cart_id, item_id);
ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.carts(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.addresses(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.carts(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
