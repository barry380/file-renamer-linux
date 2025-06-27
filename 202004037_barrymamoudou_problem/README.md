# Linux System Assignment – Barry Mamoudou (202004037)

This project is an automated file renaming tool using Docker and Bash, based on a JSON mapping rule.

## 📦 Build the Docker image

```bash
docker build -t file-renamer .
```

## ▶️ Normal execution

```bash
docker run \
 -v $(pwd)/input:/input \
 -v $(pwd)/output:/output \
 -v $(pwd)/mapping.json:/app/mapping.json \
 -v $(pwd)/logs:/app/logs \
 file-renamer
```

## 💡 Simulation mode (dry-run)

```bash
docker run \
 -v $(pwd)/input:/input \
 -v $(pwd)/output:/output \
 -v $(pwd)/mapping.json:/app/mapping.json \
 -v $(pwd)/logs:/app/logs \
 file-renamer --dry-run
```
