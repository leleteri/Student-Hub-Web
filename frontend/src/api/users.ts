const API_URL = "http://localhost:8000";

export async function createUser(name: string) {
  const res = await fetch(`${API_URL}/users?name=${encodeURIComponent(name)}`, {
    method: "POST",
  });

  if (!res.ok) {
    throw new Error("Failed to create user");
  }

  return res.json()
}

