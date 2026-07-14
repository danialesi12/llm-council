import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    // Permette l'accesso a Vite da qualsiasi dominio (incluso il tuo sslip.io di Coolify)
    allowedHosts: true 
  }
})
