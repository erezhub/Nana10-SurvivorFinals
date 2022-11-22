package com.ui
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import resources.SendBtn;
	import resources.bg.Stage1BG;
	import resources.figures.Bashevkin;
	import resources.figures.BashevkinSmall;
	import resources.figures.Kapon;
	import resources.figures.KaponSmall;
	import resources.figures.Sharon;
	import resources.figures.SharonSmall;
	import resources.figures.Shpex;
	import resources.figures.ShpexSmall;

	public class Stage1 extends Sprite
	{
		private var bg:Stage1BG;
		private var bashevkin:Figure;
		private var sharon:Figure;
		private var shpex:Figure;
		private var kapon:Figure;
		private var figures:Array;
		private var sendBtn:SendBtn;
		
		public function Stage1()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			bg = new Stage1BG();
			bg.x = 6;
			bg.y = 22;
			addChild(bg);
			
			bashevkin = new Figure(new Bashevkin(), new BashevkinSmall(),new Point(54,402));
			bashevkin.addEventListener(Event.CHANGE, onFigureSelected);
			bashevkin.x = 454;
			bashevkin.y = 122;
			addChild(bashevkin);
			
			kapon = new Figure(new Kapon(),new KaponSmall(),new Point(47,403));
			kapon.addEventListener(Event.CHANGE, onFigureSelected);
			kapon.x = 276;
			kapon.y = 108;
			addChild(kapon);
			
			shpex = new Figure(new Shpex(),new ShpexSmall(),new Point(53,402));
			shpex.addEventListener(Event.CHANGE, onFigureSelected);
			shpex.x = 124;
			shpex.y = 102;
			addChild(shpex);
			
			sharon = new Figure(new Sharon(),new SharonSmall(),new Point(51,395));
			sharon.addEventListener(Event.CHANGE, onFigureSelected);
			sharon.x = 6;
			sharon.y = 105;	
			addChild(sharon);
			
			figures = [bashevkin,kapon,shpex,sharon];	
			
			sendBtn = new SendBtn();
			addChild(sendBtn);
			sendBtn.mouseEnabled = false;
			sendBtn.x = 20;
			sendBtn.y = 553;	
		}
		
		private function onFigureSelected(event:Event):void
		{
			for (var i:int = 0; i<figures.length; i++)
			{
				figures[i].disable();
			}	
			bg.unkonwnFigure.visible = false;
			sendBtn.addEventListener(MouseEvent.CLICK, onSend);
			sendBtn.mouseEnabled = true;	
		}
		
		private function onSend(event:MouseEvent):void
		{
			visible = false;
			dispatchEvent(new Event(Event.CHANGE));
		}
		
	}
}