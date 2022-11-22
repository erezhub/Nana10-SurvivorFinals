package com.ui
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class Figure extends Sprite
	{
		private var origLoc:Point;
		private var dragRect:Rectangle;
		private var destinationRect:Rectangle;
		private var _largeVisuals:Sprite;
		private var _smallVisuals:Sprite
		private var _dropOff:Point;
		
		public function Figure(largeVisuals:Sprite, smallVisuals:Sprite,dropOff:Point)
		{
			_largeVisuals = largeVisuals;
			addChild(_largeVisuals);
			_smallVisuals = smallVisuals;
			addChild(_smallVisuals);
			_smallVisuals.visible = false;
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);	
			buttonMode = true;					
			destinationRect = new Rectangle(45,405,85,90);
			_dropOff = dropOff;
		}
		
		private function onAddedToStage(event:Event):void
		{
			addEventListener(MouseEvent.MOUSE_DOWN, onPress);
			addEventListener(MouseEvent.MOUSE_UP, onRelease);
			origLoc = new Point(x,y);
			
			dragRect = stage.getRect(stage);
			dragRect.width-= width;
			dragRect.height-=height;	
		}
		
		private function onPress(event:MouseEvent):void
		{			 
			startDrag(false,dragRect);	
			parent.addChild(this);
		}
		
		private function onRelease(event:MouseEvent):void
		{
			stopDrag();
			if (this.getRect(stage).intersects(destinationRect))
			{
				_largeVisuals.visible = false;
				_smallVisuals.visible = true;
				dispatchEvent(new Event(Event.CHANGE));
				x = _dropOff.x;
				y = _dropOff.y;
			}
			else
			{
				x = origLoc.x;
				y = origLoc.y;
			}
		}
		
		public function disable():void
		{
			buttonMode = false;
			removeEventListener(MouseEvent.MOUSE_DOWN, onPress);
		}
		
	}
}