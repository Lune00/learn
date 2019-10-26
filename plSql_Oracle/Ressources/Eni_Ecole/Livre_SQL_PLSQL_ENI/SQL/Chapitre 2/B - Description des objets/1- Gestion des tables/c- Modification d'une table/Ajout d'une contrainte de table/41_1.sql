alter table clients
add constraint cli_adrcli_un unique (adrcli)
exceptions into exceptions;