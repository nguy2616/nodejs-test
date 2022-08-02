import { Test, TestingModule } from '@nestjs/testing';
import { INestApplication } from '@nestjs/common';
import * as request from 'supertest';
import { AppModule } from './../src/app.module';

describe('AppController (e2e)', () => {
  let app: INestApplication;

  beforeEach(async () => {
    const moduleFixture: TestingModule = await Test.createTestingModule({
      imports: [AppModule],
    }).compile();

    app = moduleFixture.createNestApplication();
    await app.init();
  });

  it('/ (GET)', () => {
    return request(app.getHttpServer())
      .get('/')
      .expect(200)
      .expect('Hello World!');
  });
});

describe('BoardController (e2e)', () => {
  let app: INestApplication;

  beforeEach(async () => {
    const moduleFixture: TestingModule = await Test.createTestingModule({
      imports: [AppModule],
    }).compile();

    app = moduleFixture.createNestApplication();
    await app.init();
  });

  it('/cards (POST)', () => {
    return request(app.getHttpServer())
      .post('/cards')
      .send({
        title: 'Create a new project',
      })
      .expect(201)
      .expect({
        id: 1,
        status: 1,
        title: 'Create a new project',
      });
  });

  it('/cards/:id (PUT)', () => {
    return request(app.getHttpServer())
      .put('/cards/1')
      .send({
        status: 2,
      })
      .expect(200)
      .expect({
        id: 1,
        status: 2,
        title: 'Create a new project',
      });
  });

  it('/cards/:id (PUT) invalid status', () => {
    return request(app.getHttpServer())
      .put('/cards/1')
      .send({
        status: 4,
      })
      .expect(400);
  });
});
