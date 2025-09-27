# Word Counter Application

A simple, elegant word counter that runs in your web browser. Paste any text and instantly see the word count and character count with a beautiful, responsive interface.

## Features

- Real-time word and character counting
- Clean, modern interface with gradient design
- Responsive design that works on desktop and mobile
- One-click text clearing
- Runs standalone in browser or in Docker container

## Files Included

- `index.html` - The main application file
- `Dockerfile` - Docker configuration for containerized deployment
- `nginx.conf` - Nginx configuration for serving on port 29532
- `README.md` - This instruction file

## Running in Browser

Simply open `index.html` in any modern web browser. The application will work immediately with no additional setup required.

## Running with Docker

### Build the Docker Image

```bash
docker build -t word-counter .
```

### Run the Container

```bash
docker run -d -p 29532:29532 --name word-counter-app word-counter
```

### Access the Application

Open your browser and navigate to:
```
http://localhost:29532
```

### Stop the Container

```bash
docker stop word-counter-app
docker rm word-counter-app
```

### Alternative: One-line Run Command

If you want to run without building first:

```bash
docker run -d -p 29532:29532 --name word-counter-app word-counter
```

## Usage

1. Paste or type any text into the text area
2. Watch the word count and character count update in real-time
3. Use the "Clear Text" button to reset
4. The interface is fully responsive and works on mobile devices

## Technical Details

- **Frontend**: Pure HTML, CSS, and JavaScript - no frameworks required
- **Container**: Alpine Linux with Nginx for minimal footprint
- **Port**: Configured to run on port 29532 as requested
- **Word Counting**: Uses JavaScript regex to split on whitespace
- **Character Counting**: Includes all characters including spaces and newlines

## Browser Compatibility

Works in all modern browsers including:
- Chrome/Chromium
- Firefox
- Safari
- Edge

The application uses standard web technologies with no external dependencies.
