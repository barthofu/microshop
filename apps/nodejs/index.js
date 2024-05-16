import Fastify from 'fastify'
const fastify = Fastify({
  logger: true
})

fastify.get('/', async function handler (request, reply) {
  return 'Hello world!'
})

try {
  await fastify.listen({ 
    host: '0.0.0.0',
    port: 8080 
  })
} catch (err) {
  fastify.log.error(err)
  process.exit(1)
}