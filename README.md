# One More Rep Fitness Studio - Premium Landing Page

Welcome to the official repository for the **One More Rep Fitness Studio** landing page—Kovaipudur's premium fitness and recovery destination.

---

## ⚡ Key Features

- **Luxury Industrial Dark Aesthetics**: Harmonious dark layout featuring premium gold and red gradients, subtle tilt/magnetic micro-animations, and grain background overlays.
- **Operating Timings**: Clearly listed unisex slots and a highlighted **Ladies Exclusive Slot** (10:00 AM – 1:00 PM).
- **Membership Plans**: Full breakdown of membership durations (Lifetime, Single Day, 10 Days, 15 Days, 1 Month) and integrated Enquiry CTAs.
- **Wellness Add-Ons**: Detailed showcase of premium health diagnostics including Body Composition metrics, Customized Diet Plans, Hydration, Protein Balance, Metabolic Age, and Bone Mass.
- **Interactive BMI Calculator**: A client-side tool matching the dark theme. Supports Metric (cm/kg) and Imperial (feet-inches/kg) toggling, custom range validation, healthy range suggestions, and direct "Talk to a Trainer" WhatsApp integration.
- **Recovery Suite**: Spotlights steam room and cold plunge/ice bath therapy recovery features.
- **Careers Page & Location Map**: Integrated hiring roles and custom Google Maps iframe.

---

## 🛠️ Tech Stack

- **Core**: Semantic HTML5 & Vanilla ES6 JavaScript
- **Styling**: Modern CSS3 (Custom Variables, CSS Grid, Flexbox, Media Queries, Backdrop Filters)
- **Local Server**: System-native PowerShell HTTP listener (`server.ps1`)

---

## 🚀 Running Locally

You can launch a lightweight local server instantly without installing node packages or other dependencies.

1. Open PowerShell in the project directory.
2. Run the server script:
   ```powershell
   powershell -File server.ps1
   ```
3. Open your browser and navigate to:
   ```
   http://localhost:3000
   ```

---

## 📂 File Directory

- `index.html` - The main, optimized landing page.
- `styles.css` - Centralized design system styling (colors, grid layout, animations, responsive queries).
- `one-more-rep.html` - Standalone version with inline styles and countdown script.
- `server.ps1` - PowerShell utility to host the HTTP server on port 3000.
- `assets/` - Directory hosting hero background and recovery media.
