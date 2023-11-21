<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class AdmissionMailable extends Mailable
{
    use Queueable, SerializesModels;

    public $msg;
    public $url;

    /**
     * Create a new message instance.
     */
    public function __construct($msg, $url)
    {
        $this->msg = $msg;
        $this->url = $url;
    }

    public function build(){
        return $this->subject('Seguimiento de contacto Universidad Monte Albán')->view('emails.admission');
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Seguimiento de contacto Universidad Monte Albán',
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            view: 'emails.admission',
        );
    }

    /**
     * Get the attachments for the message.
     *
     * @return array<int, \Illuminate\Mail\Mailables\Attachment>
     */
    public function attachments(): array
    {
        return [];
    }
}
