import pygame

pygame.init()

window = pygame.display.set_mode([600, 600])

playing = True

while playing:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            playing = False

    window.fill((255, 255, 255))

    pygame.draw.circle(window, (0, 0, 255), (300, 300), 180)

    pygame.display.flip()

pygame.quit()
