import { ComponentFixture, TestBed } from '@angular/core/testing';

import { StadesComponent } from './stades.component';

describe('StadesComponent', () => {
  let component: StadesComponent;
  let fixture: ComponentFixture<StadesComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [StadesComponent]
    });
    fixture = TestBed.createComponent(StadesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
