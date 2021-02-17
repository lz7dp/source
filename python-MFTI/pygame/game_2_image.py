import pygame

pygame.init()

window = pygame.display.set_mode([940, 625])

image = pygame.image.load(r'C:\Users\dpp\Downloads\Mount-Kirkjufell-Iceland.jpg')

playing = True

while playing:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            playing = False

    window.fill((255, 255, 255))
    window.blit(image, (0, 0))

    pygame.display.update()

pygame.quit()
