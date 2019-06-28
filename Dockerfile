FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env
WORKDIR /app

COPY ./src/WajahatAliAbid.AspNetCore.DemoCICD/WajahatAliAbid.AspNetCore.DemoCICD.csproj ./
RUN dotnet restore

COPY . ./
RUN dotnet publish WajahatAliAbid.AspNetCore.DemoCICD.csproj.csproj -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "WajahatAliAbid.AspNetCore.DemoCICD.dll"]