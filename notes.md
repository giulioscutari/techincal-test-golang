
select only the domain:
        select substring(website from '(?:.*://)?(?:www\.)?([^/?]*)') as website_domain from "MY_TABLE";

This instead seems to get the needed stuff of the first point of the query:
select domain, count(domain) as domain_count from (select
    name,
    substring(
        website
        from
            '(?:.*://)?(?:www\.)?([^/?]*)'
    ) from "MY_TABLE") as domain group by domain having count(domain) > 1 order by domain_count DESC;