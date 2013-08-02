LEStatsRequest
==============

LEStatsRequest is the API client of statistics of Japan government. 
This library contributes open data movement in Japan. You can obtain 
official data with this client espacially in iOS device. iOS device 
is restricted memory capacity, so this library parses response XML
and make useful objects. Viva open government!!

## How to use

1. You put `LEStatsRequest` in your Xcode project.
2. Write your code

## APIs

LEStatsRequest has three API

* `list` : data set list 
* `meta` : data set meta information
* `data` : statistics data

You can use these API like below.

    #import "LEStatsRequest.h"
    typedef void (^Handler)(StatsResponse*);

    NSString *appId = <Your appid>;
	LEStatsRequest *request = [[LEStatsRequest alloc] initWithAppId:appId];
    NSDictionary *params = @{@"lang":@"E",@"statsDataId":@"0003003333"};

    Handler yourHandler = ^(StatsResponse* response) {
	    NSLog(@"Receive API response");
        // Write your handler
    };
    [request meta:params withHandler:yourHandler];

You need parameters and handler respectively.

### list


Parameters which should be set are written in this [manual](http://statdb.nstac.go.jp/wp/wp-content/uploads/2013/06/API-spec.pdf "manual")

| Parameter key | A use | Example |
|:-----------|:------------:|:------------:|
| lang  | Response default language | `E` or `J` |
| surveyYears |  When target data is surveyed.  Format is `yyyy` or `yyyymm` or `yyyymm-yyyymm` | `2013` | 
| openYears  | When target data is opened. Format is `yyyy` or `yyyymm` or `yyyymm-yyyymm` | `2013` | 
| statsField | The field of target statistics data. 2-digit or 4-digit number which is based on [category of statistics of Japan](http://www.e-stat.go.jp/SG1/htoukeib/TopDisp.do?bKind=10 "category of statistics of Japan") | `02` |
| statsCode | Goverment statistics code. 5-digit or 8-digit number | `12345` |
| searchWord | Your search keyword.  Any string | `Tokyo` |
| searchKind | Kind of target data | `1`: statistics data(default), `2`: regional mesh, `3`: social or population | 
| statsNameList | Statistics survey name | `Y` | 

### meta

In this API, you need to give only statsDataId. This ID is obtained from above list API.

| Parameter key | A use | Example |
|:----------|:----------:|:----------:|
| statsDataId | Statistics table id | `0003003333` | 


### data

| Parameter key | A use | Example |
|:----------|:----------:|:----------:|
| statsDataId | Statistics table id | `0003003333` | 
| lvTab | Table tag level. Format is `X` or `X-X` or `-X` or `X-` | `1-9` |
| cdTab | Item code | `01000` | 
| cdTabFrom | Start item code of range search | `01000` | 
| cdTabTo | End item code of range search | `02000` | 
| lvTime | Time level. Format is the same as category level | `1-9` | 
| cdTime | Item code about time | `01000` | 
| cdTimeFrom | Start item code of range search | `01000` | 
| cdTimeTo | End item code of range search | `02000` |
| lvArea | Area level. Format is the same as category level | `1-9` | 
| cdArea | Item code about area | `01000` | 
| cdAreaFrom | Start item code of range search | `01000` | 
| cdAreaTo | End item code of range search | `02000` |
| lvCat0[1-15] | Category level. Format is the same as category level | `1-9` | 
| cdCat0[1-15] | Item code about category | `01000` | 
| cdCat0[1-15]From | Start item code of range search | `01000` | 
| cdCat0[1-15]To | End item code of range search | `02000` |
| ・・・ | ・・・ | ・・・ |
| startPosition | Start offset of data list | `1` | 
| limit | Max number of data list | `15` | 
| metaGetFlg | Whether meta info is added or not | `Y` or `N` | 
| cntGetFlg | Only count of data list | `Y` or `N` | 








## License

[MIT License](http://opensource.org/licenses/MIT "MIT License")

## Data Source

[Gateway to Advanced and User-friendly statics service](http://statdb.nstac.go.jp/ "Data source")
