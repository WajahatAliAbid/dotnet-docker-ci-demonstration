FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env
WORKDIR /app

COPY ./src/WajahatAliAbid.DotnetCore.DemoCICD/WajahatAliAbid.DotnetCore.DemoCICD.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish WajahatAliAbid.DotnetCore.DemoCICD.csproj -c Release -o out

FROM mcr.microsoft.com/dotnet/core/runtime:2.2
WORKDIR /app
COPY --from=build-env /app/out .
CMD ["dotnet","WajahatAliAbid.DotnetCore.DemoCICD.dll"]