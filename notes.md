
### select only the domain:
```sql
select
    substring(
        website
        from
            '(?:.*://)?(?:www\.)?([^/?]*)'
    ) as website_domain
from
    "spot";
```
### Return spots which have a domain with a count greater than 1.
```sql
select domain, count(domain) as domain_count from (select
    name,
    substring(
        website
        from
            '(?:.*://)?(?:www\.)?([^/?]*)'
    ) from "spot") as domain group by domain having count(domain) > 1 order by domain_count DESC;
```
### Change the website field, so it only contains the domain.
```sql
update spot set website = substring(
        website
        from
            '(?:.*://)?(?:www\.)?([^/?]*)') where website is not null;
```
### Count how many spots have the same domain.
```sql
select
    website,
    count(id) as spot_count
from
    spot
where
    website is not null
group by
    website
order by
    spot_count qdesc;
```
### Return 3 columns : spot name, domain and count number for domain.
```sql
select
    spot.name,
    counted_domains.website,
    counted_domains.spot_count
from
    spot
    inner join (
        select
            website,
            count(id) as spot_count
        from
            spot
        where
            website is not null
        group by
            website
    ) as counted_domains on spot.website = counted_domains.website
order by
    counted_domains.spot_count desc;
```