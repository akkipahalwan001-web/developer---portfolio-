#!/usr/bin/env python3
"""Fetch a sample JSON record from a public API and save it locally."""
import json
import urllib.request
from pathlib import Path

API_URL = "https://jsonplaceholder.typicode.com/todos/1"
OUT_FILE = Path(__file__).with_name("api_response.json")

def main():
    request = urllib.request.Request(
        API_URL,
        headers={"User-Agent": "BeginnerDeveloperPortfolio/1.0"}
    )
    try:
        with urllib.request.urlopen(request, timeout=15) as response:
            status = response.status
            raw = response.read().decode("utf-8")
        data = json.loads(raw)
        OUT_FILE.write_text(json.dumps(data, indent=2), encoding="utf-8")
        print(f"HTTP status: {status}")
        print("API response parsed successfully:")
        print(json.dumps(data, indent=2))
        print(f"Saved JSON to: {OUT_FILE}")
    except Exception as exc:
        print(f"API request failed: {exc}")
        print("Check internet connection and run again.")
        raise SystemExit(1)

if __name__ == "__main__":
    main()
