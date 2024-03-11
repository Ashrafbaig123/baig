$registryName = 'Dockerimages11'
$donotdeleterepo = Get-Content value3
$donotdeleterepotags = Get-Content value4
$repoArray = (az acr repository list --name $registryName --output json | ConvertFrom-Json)
$a=0
foreach ($repo1 in $donotdeleterepo){
  foreach ($repo in $repoArray){           
    if ($repo1 -eq $repo){
    $tagsArray = (az acr repository show-tags --name $registryName --repository $repo1 --orderby time_asc --output json | ConvertFrom-Json )
    $tag1=$donotdeleterepotags[$a]      
        foreach($tag in $tagsArray){                                     
          if ($tag1 -eq $tag){
           $a++
           echo "This tag will NOT be deleted -- $repo : $tag"
           }
           else
           {
           echo "this will be deleted -- $repo : $tag"
           #az acr repository untag -n Dockerimages11 --image nginx:latest
           }
           }}
          else
          { }               
            }}
