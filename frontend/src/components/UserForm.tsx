import { useState } from "react";
import { createUser } from "../api/users";

export function UserForm() {
  const [name, setName] = useState("");
  const [status, setStatus] = useState("");

  async function submit() {
    try {
      await createUser(name);
      setStatus("User created");
      setName("");
    } catch {
      setStatus("Error creating user");
    }
  }

  return (
    <div>
      <input
        value={name}
        onChange={(e) => setName(e.target.value)}
        placeholder="name"
      />
      <button onClick={submit}>Create</button>
      <p>{status}</p>
    </div>
  );
}
