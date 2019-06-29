FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env
WORKDIR /app

COPY ./src/WajahatAliAbid.DotnetCore.DemoCICD/WajahatAliAbid.DotnetCore.DemoCICD.csproj ./
RUN dotnet restore

COPY . ./
CMD ["dotnet", "WajahatAliAbid.DotnetCore.DemoCICD.dll"]