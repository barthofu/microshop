import Fastify from 'fastify'
import process from 'node:process'

const fastify = Fastify({
	logger: {
		level: 'info',
		file: '/var/log/products-service.log'
	}
})

fastify.get('/', async function handler(request, reply) {
	
	const apiKey = process.env['API_KEY']
	console.log('Api key is:', apiKey)
	
	return 'Hello world from Products-Service'
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