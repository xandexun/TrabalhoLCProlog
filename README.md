# 🍽️ Restaurant Expert System

A system developed in **Prolog** that allows users to search for restaurants based on various personalized criteria, including location, cuisine type, budget, dietary preferences, and more.

---

## 🎯 Objective

To enable **intelligent restaurant search** based on user-defined criteria, returning the **closest restaurant** that satisfies all selected conditions.

---

## 🔍 Features

The system allows filtering restaurants by the following parameters:

- 🌍 **Country**
- 🏙️ **City**
- 🍝 **Cuisine Type** (e.g., `portuguese`, `italian`)
- 💸 **Maximum Price** (`1 = very cheap` ... `4 = very expensive`)
- 🚚 **Delivery** (`yes`, `no`, `any`)
- 📦 **Takeaway** (`yes`, `no`, `any`)
- 🌞 **Terrace** (`yes`, `no`, `any`)
- 🥗 **Diet** (`vegan`, `vegetarian`, `gluten_free`, `none`)
- 🍳 **Meal** (`breakfast`, `lunch`, `dinner`)
- 📆 **Open Day** (`mon`, `tue`, ..., or `all`)
- ⭐ **Minimum Rating** (e.g., `4.0`)
- 🏅 **Awards** (`yes`, `no`)
- 📍 **User Location** (latitude and longitude)

The system calculates the **distance between the user and restaurants**, recommending the **closest one** that matches the filters.

---

## 🧱 Project Structure

- `perito.pl`: Contains the expert system logic and user interaction interface.
- `restaurantes.pl`: Knowledge base with the restaurant data.

### 📦 Example entry in the knowledge base:

```prolog
restaurante('manjar_dos_deuses', 'portugal', 'belmonte',
  ['european', 'portuguese'], ['lunch', 'dinner'], [],
  5, 3.5, [], no, no, no, [], 0.0, 0.0).
```

---

## 💻 Installation & Execution

### 1️⃣ Install SWI-Prolog

Download and install from: [https://www.swi-prolog.org/](https://www.swi-prolog.org/)

Using VSCode? Install the Prolog extension for `.pl` file support.

---

### 2️⃣ Prepare the Project

Ensure that both `perito.pl` and `restaurantes.pl` are in the same directory.

---

### 3️⃣ Run the System

#### In SWI-Prolog:
```prolog
?- consult('perito.pl').
?- perito.
```

#### Or via terminal (VSCode or CLI):
```bash
swipl perito.pl
```

---

## ⚙️ How to Use

### Initial Menu:
```
Restaurant Expert System
Version 2025

Available commands:
1 - Load Knowledge Base
2 - Search Restaurant
3 - Exit
```

### 📁 Load Knowledge Base:
```
> 1.
Knowledge Base file name (e.g., knowledge_base.pl):
|: restaurantes.
```

### 🔎 Search for a Restaurant:
Example session:
```
> 2.
Which country? |: portugal
Which city? |: belmonte
Cuisine type? |: portuguese
Maximum price (1-4)? |: 5
Want delivery? (yes/no/any) |: no
Want takeaway? (yes/no/any) |: no
Want a terrace? (yes/no/any) |: no
Diet (vegan, vegetarian, gluten_free, none)? |: none
Meal? |: dinner
Open day? (mon, tue... or all) |: all
Minimum rating? |: 3.5
Restaurants with awards? (yes/no) |: no
Your latitude? |: 2
Your longitude? |: 2
```

### ✅ Expected Output:
```
Approximate distance (degrees): 2.83
Recommended restaurant: manjar_dos_deuses
```

---

## 👥 Authors

- **Fábio Horta**
- **Beatriz Patrício**

This project was developed as part of a university course in **Computational Logic**, focused on building expert systems using Prolog to solve real-world problems.

---

## 📄 License

This project is intended for educational purposes only. Feel free to study, modify, and expand it. 🚀
